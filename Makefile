tests: sort units printArt

ci: units 

clean:
	@xcodebuild -project osusume.xcodeproj -scheme "Osusume-Production" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.0,name=iPhone 7" clean

units:
	@xcodebuild -project osusume.xcodeproj -scheme "Osusume-Production" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.0,name=iPhone 7" build test

sort:
	perl ./bin/sortXcodeProject osusume.xcodeproj/project.pbxproj

bump:
	@./bin/bumpBuild.sh

printArt:
	@./bin/printArt.sh

