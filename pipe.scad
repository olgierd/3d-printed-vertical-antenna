// de SQ3SWF 2020

$fn=80;

h=155;              // pipe height

turns = 75;         // number of coil turns
pitch = 1.8;        // turn spacing
every = 30;         // degrees between steps
start = 10;         // distance from bottom to 

pipe_d = 40;        // pipe external diameter
thick = 1.5;        // pipe thickness

step_wid = 1.5;     // step width
step_hei = 0.6;     // step height
step_ext = 0.35;    // step protrusion

e=0.01;

difference() {
cylinder(d=pipe_d,h=h);
    translate([0,0,-e])
cylinder(d=pipe_d-2*thick,h=h+2*e);
}

for( i = [0:every:turns*360] ) {

    rotate([0,0,i+every/2])
    translate([pipe_d/2,0,pitch*i/360+start])
    rotate([0,90,0])
    cube([step_hei,step_wid,step_ext*2], center=true);   
} 
