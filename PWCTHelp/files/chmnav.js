/*************************************************************************
 chm2web Navigation Script 1.0 
 Copyright (c) 2002-2007 A!K Research Labs (http://www.aklabs.com)
 http://chm2web.aklabs.com - HTML Help Conversion Utility
**************************************************************************/

var NV = ["cover.htm","resources.htm","d1.htm","d2.htm","d30.htm","d3.htm","d4.htm","d5.htm","d6.htm","d7.htm","d8.htm","d9.htm","d10.htm","d11.htm","d12.htm","d13.htm","d14.htm","d15.htm","d16.htm","d17.htm","d18.htm","d19.htm","d20.htm","d21.htm","d22.htm","d23.htm","d24.htm","d25.htm","d26.htm","d27.htm","d28.htm","d29.htm","ado.txt","HarbourPWCTAdo1.htm","HarbourPWCTAdo2.htm","HarbourPWCTAdo3.htm","HarbourPWCTAdo4.htm","HarbourPWCTAdo5.htm","d47.htm","d50.htm","cover.jpg","main.htm","using.htm","AuthorMessage.htm","DistApp.htm","changelog.txt","license.txt","notepad++.txt","shot145.jpg","shot150.jpg","shot151.jpg","shot152.jpg","test.nova.html","fiction.txt","samples.txt","clickloop.txt","shot1.jpg","shot2.jpg","shutdown.txt","shot3.jpg","question.txt","shot4.jpg","downcounter.txt","shot5.jpg","upcounter.txt","shot6.jpg","counter.txt","shot7.jpg","counter2.txt","shot8.jpg","math.txt","shot9.jpg","shot10.jpg","math2.txt","shot11.jpg","logic.txt","shot12.jpg","logic2.txt","shot13.jpg","counterrange.txt","shot14.jpg","shot15.jpg","dynamicobjects.txt","shot16.jpg","cases.txt","shot17.jpg","shot18.jpg","checkanswer.txt","shot19.jpg","loops.txt","shot20.jpg","shot21.jpg","shot22.jpg","flex.txt","notcase.txt","shot23.jpg","flex.txt","nottab.txt","shot24.jpg","flex.txt","notspace.txt","shot25.jpg","flex.txt","notline.txt","shot26.jpg","flex.txt","dataflag.txt","shot27.jpg","flex.txt","operators.txt","shot64.jpg","shot28.jpg","wordignore.txt","wordsame.txt","gui.txt","windows.txt","controls.txt","label.txt","textbox.txt","button.txt","editbox.txt","listbox.txt","combobox.txt","checkbox.txt","progressbar.txt","slider.txt","Picture.txt","datepicker.txt","hyperlink.txt","spinner.txt","statusbar.txt","menubar.txt","gui.txt","windowevents.txt","shot56.jpg","shot57.jpg","shot58.jpg","shot59.jpg","shot60.jpg","shot61.jpg","shot62.jpg","shot63.jpg","gui.txt","labelonebutton.txt","shot29.jpg","shot30.jpg","gui.txt","labeltwobuttons.txt","shot31.jpg","shot32.jpg","shot33.jpg","gui.txt","labelthreebuttons.txt","shot34.jpg","shot35.jpg","shot36.jpg","gui.txt","checkboxtwobuttons.txt","shot54.jpg","shot55.jpg","colors.txt","colorscode.txt","shot130.jpg","gui.txt","windowinstances.txt","shot37.jpg","gui.txt","textboxinstances.txt","shot38.jpg","shot39.jpg","shot40.jpg","shot41.jpg","gui.txt","editboxinstances.txt","shot42.jpg","shot43.jpg","shot44.jpg","gui.txt","listboxinstances.txt","shot45.jpg","shot46.jpg","shot47.jpg","shot48.jpg","gui.txt","comboboxinstances.txt","shot49.jpg","gui.txt","checkboxinstances.txt","shot50.jpg","shot51.jpg","shot52.jpg","shot53.jpg","dostatements.txt","dostatementssource.txt","shot65.jpg","shot66.jpg","stringoperators.txt","stringcode.txt","shot67.jpg","shot68.jpg","shot69.jpg","shot70.jpg","shot71.jpg","shot72.jpg","shot73.jpg","shot74.jpg","shot75.jpg","shot76.jpg","shot77.jpg","shot78.jpg","shot79.jpg","shot80.jpg","shot81.jpg","shot82.jpg","shot83.jpg","DateTime.txt","DateTimeCode.txt","shot84.jpg","shot85.jpg","shot86.jpg","shot87.jpg","shot88.jpg","shot89.jpg","shot90.jpg","shot91.jpg","shot92.jpg","shot93.jpg","LookToFuture.txt","LookToFutureCode.txt","shot94.jpg","shot95.jpg","shot96.jpg","shot97.jpg","shot98.jpg","shot99.jpg","Macro.txt","MacroCode.txt","shot100.jpg","shot101.jpg","shot102.jpg","shot103.jpg","shot104.jpg","shot105.jpg","shot106.jpg","shot107.jpg","Arrays.txt","ArraysSource.txt","shot115.jpg","shot116.jpg","files.txt","filessource.txt","shot131.jpg","shot132.jpg","shot133.jpg","shot134.jpg","shot135.jpg","shot136.jpg","shot137.jpg","delivery.txt","deliverycode.txt","shot138.jpg","shot139.jpg","distdelivery.txt","deliverycode2.txt","shot140.jpg","deliverychanges.txt","extension.txt","calldllcode.txt","shot141.jpg","soundplayerlib.txt","soundplayerlibsource.txt","shot142.jpg","soundrecorderlib.txt","soundrecorderlibsource.txt","shot143.jpg","movieplayerlib.txt","movieplayerlibsource.txt","shot144.jpg","com.txt","com.htm","shot146.jpg","adodb.txt","adodb.htm","shot148.jpg","Multilang.txt","Multilanguage.htm","shot112.jpg","shot114.jpg","shot113.jpg","shot111.jpg","shot108.jpg","shot109.jpg","shot110.jpg","Performance.txt","PerformanceSource.txt","Errors.txt","ErrorsSource.txt","grammer.txt","EnglishGrammer.txt","d31.htm","d32.htm","d33.htm","d34.htm","d35.htm","d36.htm","d37.htm","d38.htm","d39.htm","d40.htm","d41.htm","d42.htm","d43.htm","d44.htm","d45.htm"];
var s = "";
function getNav(op) { var p=chmtop.c2wtopf.pageid;var n=s+p; var m=NV.length-1;for(i=0;i<=m;i++){if(NV[i]==p){if(op=="next"){if (i<m) {curpage=i+1;return s+NV[i+1];} else return n;}else{if(i>0) {curpage=i-1;return s+NV[i-1];} else return n;}}} return n;}
function syncTopic(){open('helpheaderc.html', 'header');open('helpcontents.html','toc');}
