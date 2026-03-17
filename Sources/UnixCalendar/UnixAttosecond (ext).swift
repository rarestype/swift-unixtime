public import UnixTime

#if canImport(Glibc)
public import struct Glibc.timespec
public import struct Glibc.tm

public import func Glibc.clock_gettime
public import var Glibc.CLOCK_REALTIME
public import func Glibc.gmtime_r
public import func Glibc.timegm

#elseif canImport(Darwin)
public import struct Darwin.timespec
public import struct Darwin.tm

public import func Darwin.clock_gettime
public import var Darwin.CLOCK_REALTIME
public import func Darwin.gmtime_r
public import func Darwin.timegm
#else
#error("Platform doesn’t support 'clock_gettime'")
#endif

extension UnixAttosecond {
    /// Returns the current maximum-precision time by calling into the operating system.
    public static func now() -> Self {
        var time: timespec = .init()

        if  clock_gettime(CLOCK_REALTIME, &time) != 0 {
            fatalError("system clock unavailable! (CLOCK_REALTIME)")
        }

        return .second(
            Int64.init(time.tv_sec),
            attoseconds: Int64.init(time.tv_nsec) * 1_000_000_000
        )
    }
}
extension UnixAttosecond {
    /// Y3K bug!
    @inlinable public init?(
        utc timestamp: Timestamp.Components,
        sanity checks: Timestamp.Sanity = .year(in: 1970 ... 2970)
    ) {
        switch checks {
        case .unchecked:    break
        case .year(in: let range):
            guard range.contains(timestamp.date.year) else {
                return nil
            }
        }

        var time: tm = .init(
            tm_sec: timestamp.time.second,
            tm_min: timestamp.time.minute,
            tm_hour: timestamp.time.hour,
            tm_mday: timestamp.date.day,
            tm_mon: timestamp.date.month.rawValue - 1, // month in range 0 ... 11 !
            tm_year: timestamp.date.year.rawValue - 1900,
            tm_wday: -1,
            tm_yday: -1,
            tm_isdst: 0,

            tm_gmtoff: 0,
            tm_zone: nil
        )

        switch withUnsafeMutablePointer(to: &time, timegm) {
        case -1:            return nil
        case let second:    self = .second(Int64.init(second))
        }
    }

    public var timestamp: Timestamp? { .init(secondSinceEpoch: Int.init(self.second)) }
}
