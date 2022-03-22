
#all: build-iphoneos build-iphonesimulator

scheme:
	echo "Set the scheme!"

clean:
	pod deintegrate
	rm Podfile.lock
	rm -rf Pods
	rm -rf MobiledgeXiOSGrpcLibrary.xcworkspace

pod:
	pod install
