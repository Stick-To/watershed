# naive implementation of watershed algorithm with matlab

# the result  is almost have no difference with matlab API.

the implmention follow Digital Image Processing_3ed_Gonzalez step by step

myrgb2gray.m               rgb to gray

mygradient.m               get gradient

myblur.m                   image blur 

mywatershed.m              watershed function body

sepcor.m                   special dilate function used by watershed function

regrow.m                   region growing algorithm
    

get_waterline.m            save result as .mat

show_water_line.m          show result as image
