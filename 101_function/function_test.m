x = [1.3,nan,3.0;
     -1.33,-2.56,-3.53;
    -4.05,-5.24,nan;
    1.21,-5.54,6.146;
    5.2,-2.03,5.1];
 
y = [1.6554,5.4648,nan;
     -1.121,-2.3854,-3.848;
     nan,67.2,-6.654;
     -1.11,3.654,5.021];
 
d=3;


ADV_D(x,d)
CORRELATION(x,y,d)
COVARIANCE(x,y,d)
DECAY_LINEAR(x,d)
DELAY(x,d)
DELTA(x, d)
PRODUCT(x,d)