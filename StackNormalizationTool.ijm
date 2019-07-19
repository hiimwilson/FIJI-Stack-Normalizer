// Difference Image Macro 

// Normalizes an open image stack relative to an input frame of choice. Output is a 32-bit float stack
// 		as a fraction (frame_i/frame_range). Multiply by 100 to get percent difference. 

stack = getTitle()

// User Dialog to identify frames
Dialog.create("Frame to Normalize")
Dialog.addMessage("Image Slice(s) to Normalize Against?")
Dialog.addNumber("slice start = ", 1)
Dialog.addNumber("slice end = ", 1)
Dialog.show()

frame1 = Dialog.getNumber();
frame2 = Dialog.getNumber();
selectWindow(stack)
run("Duplicate...", "duplicate range=&frame1-&frame2");
norm_stack = getTitle()
selectWindow(norm_stack)
run("Z Project...", "projection=[Average Intensity]");			// Create Stack to Normalize against
mean = getTitle();		
close(norm_stack);
imageCalculator("Divide create 32-bit stack", stack, mean);		// Divide stack be mean image
final = getTitle()
close(mean)
selectWindow(final)
rename(stack+"_norm")
run("ICA ");
//run("!WRA_OrangeLowCyanHigh"); // Run if you have VBC Update Site installed
