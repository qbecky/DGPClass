# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.bin2c.Debug:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/bin2c:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/bin2c


PostBuild.glfw.Debug:
PostBuild.glfw_objects.Debug: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/Debug/libglfw3.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/Debug/libglfw3.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/Debug/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/Debug/libglfw3.a


PostBuild.glfw_objects.Debug:
PostBuild.nanogui.Debug:
PostBuild.glfw_objects.Debug: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/libnanogui.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/libnanogui.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/Debug/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/libnanogui.a


PostBuild.bin2c.Release:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/bin2c:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/bin2c


PostBuild.glfw.Release:
PostBuild.glfw_objects.Release: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/Release/libglfw3.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/Release/libglfw3.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/Release/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/Release/libglfw3.a


PostBuild.glfw_objects.Release:
PostBuild.nanogui.Release:
PostBuild.glfw_objects.Release: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/libnanogui.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/libnanogui.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/Release/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/libnanogui.a


PostBuild.bin2c.MinSizeRel:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/bin2c:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/bin2c


PostBuild.glfw.MinSizeRel:
PostBuild.glfw_objects.MinSizeRel: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/MinSizeRel/libglfw3.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/MinSizeRel/libglfw3.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/MinSizeRel/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/MinSizeRel/libglfw3.a


PostBuild.glfw_objects.MinSizeRel:
PostBuild.nanogui.MinSizeRel:
PostBuild.glfw_objects.MinSizeRel: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/libnanogui.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/libnanogui.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/MinSizeRel/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/libnanogui.a


PostBuild.bin2c.RelWithDebInfo:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/bin2c:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/bin2c


PostBuild.glfw.RelWithDebInfo:
PostBuild.glfw_objects.RelWithDebInfo: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/RelWithDebInfo/libglfw3.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/RelWithDebInfo/libglfw3.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/RelWithDebInfo/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/RelWithDebInfo/libglfw3.a


PostBuild.glfw_objects.RelWithDebInfo:
PostBuild.nanogui.RelWithDebInfo:
PostBuild.glfw_objects.RelWithDebInfo: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/libnanogui.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/libnanogui.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/RelWithDebInfo/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/libnanogui.a




# For each target create a dummy ruleso the target does not have to exist
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/Debug/glfw_objects.build/libglfw_objects.a:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/MinSizeRel/glfw_objects.build/libglfw_objects.a:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/RelWithDebInfo/glfw_objects.build/libglfw_objects.a:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/NanoGUI.build/Release/glfw_objects.build/libglfw_objects.a:
