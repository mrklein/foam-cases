union() {
    translate([8e-2, -1e-2, -1.8e-2]) {
        rotate([90, 0, 90]) {
            cylinder(h=11e-2, r=0.5e-2, center=true, $fn=180);
        }
    }
    translate([-8e-2, 1e-2, 1.8e-2]) {
        rotate([90, 0, 90]) {
            cylinder(h=11e-2, r=0.5e-2, center=true, $fn=180);
        }
    }
    difference() {
        cylinder(h=6e-2, r=3e-2, center=true, $fn=180);
        cylinder(h=7e-2, r=1e-2, center=true, $fn=180);
    }
}
