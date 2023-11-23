# DrawingMachines
This repository contains code and instructions for operating the drawing machines at Foulab, mainly the plotters.


# TL;DR

Long instructions are boring, and my attention span is short.  I want to plot something right now.

- Prequisite
  - A working python 3.  Can be a conda, or a system python.

- Plot a precreated file
  - Linux
  - check if you are in the dialout group
  ```
  groups
  ```
  - if dialout is not listed, add it with 
  ```
  sudo usermod -a -G dialout user
  ```
  logout login may be required
  - git clone this repo
  ```
  git clone git@github.com:FOULAB/DrawingMachines.git
  ```
  - Build a python environment with the necessary code
  ```
  ./build_environment.sh <environment_name>
  ```
  - Activate this environment
  ```
  . <environment_name>/bin/activate
  ```
  - Connect the plotter
  
  Most plotters are driven over serial, using an interface wired in a nonstandard way. For the large HP at Foulab, this is prepared for you.  

  INSERT PHOTOGRAPH
  
  - Probe the plotter
  ```
  chiplotle3
  ```
  - Load paper and pen

  INSERT PHOTOGRAPHS

  - Run the test and plot the test file
  ```
  plot_hpgl_file 
  ```
  - Rejoice, you have plotted a drawing!
- Create a file and plot it
  - Run this notebook, download the resulting file
  - Plot the resulting file
  - Rejoice more, you have algorithmically created, and then plotted a drawing!

# Detailed Discussion

In the following discussion, we will work from closest to the paper to greater and greater levels of abs

## Driving the plotter

The plotter understands HPGL, and it has to be fed this HPGL over a serial port.  You can probably achieve this with most serial port communication programs, but a piece of software especially useful for this is Chiplotle.

Create a python3 virtual environment, and pip install Chiplotle3   (note that pip can also find the chiplotle package, but that is python 2 only)

Testing

Loading paper

Choosing paper

Choosing pens

## Making HPGL

A HPGL file for a specific drawing is plotter specific.   The software vpype can be used to generate it, but it needs a configuration file specific to your plotter.  You can get this file here.

Most plotters support 5-8 different pens.  In general, registration is good so long as the paper is left in place, so an alternative method of changing pens is to just send separate drawing files.

Plot requests outside the paper area will be ignored by the plotter – performing this geometric trimming is quite slow, so it is best not to rely on it, but it is a nice safety feature.

The efficiency of carrying out a plot is related to the geometric instructions given to the plotter.  For example, if it is instructed to jump repeatedly from one side of the paper to the other, this will make the plot slower, than if the lines are organized to minimized pen movement.

Remember this is a physical drawing.  You may wish to consider ink and pen effects – e.g. the point where the pen started and ended is often slightly visible.  If drawing many circles, and they all start from the same angle, this will be apparent in the final drawing.  These effects may or may not be desirable depending on your artistic goal.

Vpype can be used to draw directly, but this is a bit clunky.  It also reads SVG as input.  

## Basic SVG manipulation - VPYPE

Vpype can be used to perform various simple manipulations which can be used to prepare a file for plotting.   These include

### Sizing
### Layer manipulation
### Framing
### Adding text
### Assembling a page
### Optimizing plot paths

## Other SVG tools

### Inkscape

### Shapely

### Processing

## Plotter art – Case studies

### A postcard, including text

### Some geometry

### A map

### Rendering images 1: Simple Shading

### Rendering images 2: Single line drawings (TSP)
