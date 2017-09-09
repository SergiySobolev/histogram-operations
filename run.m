 ex1 = 'ex1.png';
 ex2 = 'cameramen.png';
 ex3 = 'ex2.png';
 
 imName = ex1;

 subplot(6,1,1);
 im = imread(imName);
 imshow(im);
 title('Input image');
 
  
 grayLevelsNumber = 256;
 hobj = Histogram(imread(imName),grayLevelsNumber);
 histogram = buildHistogram(hobj);
 subplot(6,1,2);
 bar(histogram);
 title('Histogram');xlabel('Gray Level');ylabel('Number of occurence');
 xlim([1,grayLevelsNumber]);
 
 nHistogram = buildNormalizedHistogram(hobj); 
 subplot(6,1,3);
 bar(nHistogram);
 title('Normalized histogram');xlabel('Gray Level');ylabel('Probability');
 xlim([1,grayLevelsNumber]);
 
 cdf = buildCumulativeDensityFunction(hobj); 
 subplot(6,1,4);
 plot(cdf);
 title('Cumulative density function');xlabel('Gray Level');ylabel('Probability');
 xlim([1,grayLevelsNumber]);
 ylim([0,1.3])
 
 eImage = equalizeImage(hobj, round(cdf*grayLevelsNumber));
 subplot(6,1,5);
 imshow(eImage);
 title('Equalized image');
 
 eHObj = Histogram(eImage,grayLevelsNumber); 
 ehistogram = buildHistogram(eHObj);
 subplot(6,1,6);
 bar(ehistogram);
 title('Histogram');xlabel('Gray Level');ylabel('Number of occurence');
 xlim([1,grayLevelsNumber]);
 