$fn=100;

h = 10;

d_in = 40.5;            // internal diameter
thick = 2;              // wall thickness
nut = 5.5;              // nut size
nut_h = 4;              // nut hole depth
screw = 3.5;            // screw diameter

oval_f = 1.2;           // ovalness factor

////////////////////

nut_dia = 0.2+2*nut*sqrt(3)/3;
e=0.01;

difference() {

    scale([oval_f,1,1])
    union() {
        cylinder(d=d_in+2*thick,h=h, center=true);
        translate([0,-(d_in+2*thick)/2,0])
        cube([h,d_in/8,h], center=true);
    }
    
    // inner cylinder
    scale([oval_f,1,1])
    cylinder(d=d_in,h=h+2*e, center=true);
    
    
    // screw hole
    translate([0, -d_in/2, 0])
    rotate([90,0,0])
    cylinder(d=screw, h=d_in, center=true);
    
    // screw nut
    translate([0, -(d_in+thick)/2, 0])
    rotate([90,0,0])
    cylinder(d=nut_dia, h=nut_h, center=true, $fn=6);

    // viewing holes
    for(i = [-1:2:1]) {
        translate([0, -17, 0])
        rotate([90,0,75*i])
        translate([0, 0, d_in/2])
        cylinder(d=4, h=d_in, center=true);   
    }
    
}
