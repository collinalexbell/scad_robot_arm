function center(lower, upper) = lower + ((upper-lower)/2);

module regular_polygon(order = 4, r=1){
    angles=[ for (i = [0:order-1]) i*(360/order) ];
    coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
    polygon(coords);
  }


