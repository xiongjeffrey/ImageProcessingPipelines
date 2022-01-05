function [convolution] = convolute(input, kernel)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    flipped_kern = flip(kernel, 1);
    flipped_kern = flip(kernel, 2);

    input_W = length(input(1, :));
    input_H = length(input(:, 1));

    kern_W = length(kernel(1, :));
    kern_H = length(kernel(:, 1));

    adjust_x = (kern_W+1)/2;
    adjust_y = (kern_H+1)/2;

    for i = 1:input_W
        for j = 1:input_H

            % condition that dimensions of kernel are guaranteed to be odd
            for a = (0 - floor(kern_W/2)):floor(kern_W/2)
                for b = (0 - floor(kern_H/2)):floor(kern_H/2)

                    dumIdx_x = i + a;
                    dumIdx_y = j + b;

                    if dumIdx_x < 1 || dumIdx_x > input_W || dumIdx_y < 1 || dumIdx_y > input_H
                        dummy(b + adjust_y, a + adjust_x) = 0;
    
                    else
                        dummy(b + adjust_y, a + adjust_x) = input(dumIdx_y, dumIdx_x);
    
                    end
    
                end
    
            end
            convolution(j, i) = dot(dummy(:), flipped_kern(:));
    
        end
    
    end
end