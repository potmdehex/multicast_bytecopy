# multicast_bytecopy 

**This code is published for security researchers, do not use this code for any purpose unless you know what you are doing.**

multicast_bytecopy is a kernel r/w exploit for iOS 15.0 - 15.1.1 by [@jaakerblom](https://twitter.com/jaakerblom) and the spiritual successor of [multipath_kfree](https://github.com/potmdehex/multipath_kfree). 

The exploit can be adapted to gain kernel r/w on prior iOS versions. **This implementation is for iOS 15.0 - 15.1.1.**

The bug exploited is [CVE-2021-30937](https://bugs.chromium.org/p/project-zero/issues/detail?id=2224) patched in iOS 15.2. The code uses [iokit.h](https://github.com/Siguza/iokit-utils/blob/master/src/iokit.h) by [@s1guza](https://twitter.com/s1guza) and a couple of [IOSurface definitions](https://bugs.chromium.org/p/project-zero/issues/detail?id=1986#c4) by [@bazad](https://twitter.com/bazad).
