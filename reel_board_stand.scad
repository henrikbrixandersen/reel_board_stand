/*
 * Copyright (c) 2018 Henrik Brix Andersen <henrik@brixandersen.dk>
 *
 * SPDX-License-Identifier: Apache-2.0
 */

// Rendering
$fn = 100;

// Dimensions (mm)
stand_h = 44 + 10;
stand_w = 11;

foot_h = 10;
foot_w = 53 + 2 * 31;

foot_end_d = 1.25 * foot_h;

difference() {
    union() {
        translate([0, stand_h / 2, 0]) {
            square([stand_w, stand_h], true);
        }
        square([foot_w, foot_h], true);
        
        for (i = [-1, 1]) {          
            translate([i * foot_w / 2, foot_end_d / 2 - foot_h / 2, 0]) {
                circle(d = foot_end_d);
            }
        }
        
        hull() {
            for (i = [-1, 1]) {
                translate([i * foot_h / 2, 0, 0]) {
                    square([foot_h, foot_h], true);
                }
            }
            translate([0, foot_h / 2, 0]) {
                square([stand_w, stand_w], true);
            }
        }
    }
    
    for (i = [-1, 1]) {
        translate([i * foot_w / 2 - foot_h / 2 * i, foot_h, 0]) {
            square([foot_h, foot_h], true);
        }
    }
}