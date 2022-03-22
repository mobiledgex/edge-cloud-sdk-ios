Quick build instructions:

For simulator build, uncomment the line for:
#config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = "arm64"

Note that his may break M1 ARM simulator builds, but the output has generation
for both x86_64 and arm64 architectures for simulator.

For release builds, set the project scheme to "Release", under

Project --> Scheme --> Edit Scheme

Make clean to deintegrate the Podfile, and run again with the line defined
for simulator builds. Do so again to swap back.

Because some stuff is built for distribution, the app must also build for
distribution, or else at runtime, symbols will be missing.

For release builds, it only builds for the current architecture by default.
grpc-Swfit is being set for Library Evolution mode, although it doesn't fully
officially support it yet due to performance concerns. However, we need to
build a binary, so have marked some things to build separately, both in app,
and library due to ABI stability concerns. The app should be tracking grpc
functionality changes as it is exposed to the raw data types (which are quite
descriptive, and pointless to duplicate for performance ressons), even if
the wire protocol stays the same.

Currently, there's a build detail to work around for a gRPC-Swift depedency:

CNIOAtomics, for threading atomics support, needs to be set to Multi-Arch builds
under Pods --> CNIOAtomics --> Build Settings --> Allow Multi-Platform Bulids.

M1 compile situation: TBD.
