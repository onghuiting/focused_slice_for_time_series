

// This macro finds in-focus slice (from a z stack) for time series.
// This macro uses plugins, Find_focused_slices.class from (https://sites.google.com/site/qingzongtseng/find-focus)
//
// Written by hui ting, 26 aug 2015.


image_name=getTitle;
Stack.getDimensions(width, height, channels, slices, frames);

for (i=1;i<=frames;i++){

selectWindow(image_name);
run("Duplicate...", "title=["+image_name+"_temp.tif] duplicate slices=1-"+slices+" frames="+i); // change slices range

selectWindow(image_name+"_temp.tif");
run("Find focused slices", "select=100 variance=0.000 verbose");
rename(i);
close(image_name+"_temp.tif");



}

run("Images to Stack", "name=["+image_name+" focused slices] title=[] use");


