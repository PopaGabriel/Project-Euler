
allPairs::Int->[[Int]]
allPairs limit = [[x + y + z, x * y * z, x , y, z] |x<-[1..limit], y<-[1..limit], z<-[1..limit], x + y + z == 1000 && x*x + y*y == z*z]