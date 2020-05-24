
in_dia = 37;
shift = 15;
height = 25;

// base
cube([40,70,3], center=true);

difference() {
    translate([0,shift,0]) {
        for(i = [0,90,90]) {
            // main supports
            translate([0,0,12]) 
            rotate([0,0,i])
            cube([in_dia,2,25], center=true);
            
            // chamfers for supports
            rotate([45,0,i])
            cube([in_dia, 7, 7], center=true);
        }

    }

    // cut off the bottom
    translate([0,0,-5])
    cube([200,200,10], center=true);

    // cut the outer boundary
    translate([0,shift,0])
    difference() {
        cylinder(d=in_dia+5, h=30, $fn=100,center=true);
        cylinder(d=in_dia, h=31, $fn=100,center=true);
    }

}
