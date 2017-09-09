classdef Histogram
        
    properties
        image
        grayLevelsNumber
    end
    
    methods
        function obj = Histogram(image, grayLevelsNumber)
            obj.image = image;
            obj.grayLevelsNumber = grayLevelsNumber;            
        end
        
        function histogram = buildHistogram(obj)
            w = size(obj.image,1);
            h = size(obj.image,2);
            histogram = zeros(obj.grayLevelsNumber,1);
            for i=1:w
                for j=1:h
                    g = obj.image(i,j);                    
                    histogram(g+1) = histogram(g+1) + 1;
                end
            end
        end
        
        function nHistogram = buildNormalizedHistogram(obj)
            w = size(obj.image,1);
            h = size(obj.image,2);
            nHistogram = buildHistogram(obj)./(w*h);
        end
        
        function cdf = buildCumulativeDensityFunction(obj)
            histogram = buildHistogram(obj);           
            cdf = zeros(obj.grayLevelsNumber,1);
            cdf(1) = histogram(1);
            for i=2:obj.grayLevelsNumber
                cdf(i) = cdf(i-1) + histogram(i);
            end
            w = size(obj.image,1);
            h = size(obj.image,2);
            cdf = cdf./(w*h);
        end
        
        function eImage = equalizeImage(obj, g)           
            w = size(obj.image,1);
            h = size(obj.image,2);
            eImage = uint8(zeros(w,h));
            for i=1:w
                for j=1:h
                    eImage(i,j) = g(obj.image(i,j)+1);
                end
            end
        end
        
    end
    
end

