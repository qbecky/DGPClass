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
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/Debug/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/Debug/libglfw3.a


PostBuild.glfw_objects.Debug:
PostBuild.iso_contouring.Debug:
PostBuild.surface_mesh.Debug: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Debug/iso_contouring
PostBuild.nanogui.Debug: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Debug/iso_contouring
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Debug/iso_contouring:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/Debug/libsurface_mesh.1.0.dylib\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/libnanogui.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Debug/iso_contouring


PostBuild.isotest.Debug:
PostBuild.Catch2.Debug: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Debug/isotest
PostBuild.nanogui.Debug: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Debug/isotest
PostBuild.surface_mesh.Debug: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Debug/isotest
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Debug/isotest:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/libnanogui.a\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/Debug/libsurface_mesh.1.0.dylib
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Debug/isotest


PostBuild.nanogui.Debug:
PostBuild.glfw_objects.Debug: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/libnanogui.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/libnanogui.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/Debug/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/libnanogui.a


PostBuild.surface_mesh.Debug:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/Debug/libsurface_mesh.dylib:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/Debug/libsurface_mesh.dylib


PostBuild.bin2c.Release:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/bin2c:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/bin2c


PostBuild.glfw.Release:
PostBuild.glfw_objects.Release: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/Release/libglfw3.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/Release/libglfw3.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/Release/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/Release/libglfw3.a


PostBuild.glfw_objects.Release:
PostBuild.iso_contouring.Release:
PostBuild.surface_mesh.Release: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Release/iso_contouring
PostBuild.nanogui.Release: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Release/iso_contouring
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Release/iso_contouring:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/Release/libsurface_mesh.1.0.dylib\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/libnanogui.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Release/iso_contouring


PostBuild.isotest.Release:
PostBuild.Catch2.Release: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Release/isotest
PostBuild.nanogui.Release: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Release/isotest
PostBuild.surface_mesh.Release: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Release/isotest
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Release/isotest:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/libnanogui.a\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/Release/libsurface_mesh.1.0.dylib
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/Release/isotest


PostBuild.nanogui.Release:
PostBuild.glfw_objects.Release: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/libnanogui.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/libnanogui.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/Release/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/libnanogui.a


PostBuild.surface_mesh.Release:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/Release/libsurface_mesh.dylib:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/Release/libsurface_mesh.dylib


PostBuild.bin2c.MinSizeRel:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/bin2c:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/bin2c


PostBuild.glfw.MinSizeRel:
PostBuild.glfw_objects.MinSizeRel: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/MinSizeRel/libglfw3.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/MinSizeRel/libglfw3.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/MinSizeRel/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/MinSizeRel/libglfw3.a


PostBuild.glfw_objects.MinSizeRel:
PostBuild.iso_contouring.MinSizeRel:
PostBuild.surface_mesh.MinSizeRel: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/MinSizeRel/iso_contouring
PostBuild.nanogui.MinSizeRel: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/MinSizeRel/iso_contouring
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/MinSizeRel/iso_contouring:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/MinSizeRel/libsurface_mesh.1.0.dylib\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/libnanogui.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/MinSizeRel/iso_contouring


PostBuild.isotest.MinSizeRel:
PostBuild.Catch2.MinSizeRel: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/MinSizeRel/isotest
PostBuild.nanogui.MinSizeRel: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/MinSizeRel/isotest
PostBuild.surface_mesh.MinSizeRel: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/MinSizeRel/isotest
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/MinSizeRel/isotest:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/libnanogui.a\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/MinSizeRel/libsurface_mesh.1.0.dylib
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/MinSizeRel/isotest


PostBuild.nanogui.MinSizeRel:
PostBuild.glfw_objects.MinSizeRel: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/libnanogui.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/libnanogui.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/MinSizeRel/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/libnanogui.a


PostBuild.surface_mesh.MinSizeRel:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/MinSizeRel/libsurface_mesh.dylib:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/MinSizeRel/libsurface_mesh.dylib


PostBuild.bin2c.RelWithDebInfo:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/bin2c:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/bin2c


PostBuild.glfw.RelWithDebInfo:
PostBuild.glfw_objects.RelWithDebInfo: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/RelWithDebInfo/libglfw3.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/RelWithDebInfo/libglfw3.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/RelWithDebInfo/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/RelWithDebInfo/libglfw3.a


PostBuild.glfw_objects.RelWithDebInfo:
PostBuild.iso_contouring.RelWithDebInfo:
PostBuild.surface_mesh.RelWithDebInfo: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/RelWithDebInfo/iso_contouring
PostBuild.nanogui.RelWithDebInfo: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/RelWithDebInfo/iso_contouring
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/RelWithDebInfo/iso_contouring:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/RelWithDebInfo/libsurface_mesh.1.0.dylib\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/libnanogui.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/RelWithDebInfo/iso_contouring


PostBuild.isotest.RelWithDebInfo:
PostBuild.Catch2.RelWithDebInfo: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/RelWithDebInfo/isotest
PostBuild.nanogui.RelWithDebInfo: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/RelWithDebInfo/isotest
PostBuild.surface_mesh.RelWithDebInfo: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/RelWithDebInfo/isotest
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/RelWithDebInfo/isotest:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/libnanogui.a\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/RelWithDebInfo/libsurface_mesh.1.0.dylib
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/iso_contouring/RelWithDebInfo/isotest


PostBuild.nanogui.RelWithDebInfo:
PostBuild.glfw_objects.RelWithDebInfo: /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/libnanogui.a
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/libnanogui.a:\
	/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/RelWithDebInfo/glfw_objects.build/libglfw_objects.a
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/libnanogui.a


PostBuild.surface_mesh.RelWithDebInfo:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/RelWithDebInfo/libsurface_mesh.dylib:
	/bin/rm -f /Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/RelWithDebInfo/libsurface_mesh.dylib




# For each target create a dummy ruleso the target does not have to exist
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/Debug/libsurface_mesh.1.0.dylib:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/MinSizeRel/libsurface_mesh.1.0.dylib:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/RelWithDebInfo/libsurface_mesh.1.0.dylib:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/externals/surface_mesh/Release/libsurface_mesh.1.0.dylib:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Debug/libnanogui.a:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/MinSizeRel/libnanogui.a:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/RelWithDebInfo/libnanogui.a:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/Release/libnanogui.a:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/Debug/glfw_objects.build/libglfw_objects.a:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/MinSizeRel/glfw_objects.build/libglfw_objects.a:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/RelWithDebInfo/glfw_objects.build/libglfw_objects.a:
/Users/qbecker/Documents/Fall2019/DGPClass/dgp2019_exercise3/build/nanogui/ext_build/glfw/src/dgp2019_exercise3.build/Release/glfw_objects.build/libglfw_objects.a:
