# h96_max_rk3118


## TLDR

The H96 Max is a low cost Arm based SBC can be purchased with a case and PSU for around (~£30) 1/2 the price of an equivent Pi4 (~£60).  
It will run a mainline linux kernel and it possible to get a box from factory up and running with ArchLinux and SSH in less than a hour with just a suitably prepared SDCard. 

## Project

A place to document and share code and images in the pursuit of converting H96 Max Android TV boxes into linux based microservers.  

Ideally forming a low power low cost kubernetes cluster for home lab.


## hardware

H96 MAX RK3318 4GB RAM 32GB ROM

- CPU: RK3318 Quad-Core 64bit Cortex-A53 
- GPU: Penta-Core Mali-450 Up to 750Mhz+ **--UNTESTED**
- RAM: 4GB DDR3
- ROM: EMMC 32G
- Ethernet: 100M LAN
- WIFI: Built in 2.4G /5G 802.11 a/b/g/n **--UNTESTED**
- bluetooth: 4.0 **--UNTESTED**

These devices can be picked up from ebay/banggood etc for around £25-30 also alaivable with 2/16Gb and 4/64Gb variantes 

Banggood Affility link https://www.banggood.com/custlink/KGDhWs6R6v but available elsewere

## Goals
- Run Linux Kernel and Boot 
  - Boot from SD Card  **-- Working**
  - Install and Run via emmc **-- UNTESTED**
- Install docker **--Docker version 19.03.12-ce, build 48a66213fe**
- Run basic docker images  **-- DONE (netdata)**
- Run as kubernetes worker  **-- Basic test via rancher**
- 




