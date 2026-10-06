

// This is to generate all-in-focus image (from a z-stack) for each time point.
// This macro uses EDF plugin, from (http://bigwww.epfl.ch/demo/edf/)
//
// Written by hui ting, 1 oct 2019.


dir = getDirectory("Choose a input folder");

list = getFileList(dir);
res_dir = dir+"EDF_results";
File.makeDirectory(res_dir);

print(list.length);
for (i=0; i<list.length; i++) {
	
     if (endsWith(list[i], ".tiff")){
     	
           open(dir+list[i]);
           run("EDF Easy ", "quality='4' topology='1' show-topology='off' show-view='off'");
		   wait(15000);
		   selectWindow("Output");
		   rename(i+1);
		   saveAs("Tiff", res_dir+File.separator+list[i]+"_EDF.tif");
	       run("Close All");
    
     }
}





