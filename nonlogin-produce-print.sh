#!/bin/bash --login

hostname>~/LinuxFundamentals2015/Week1/hostname.txt;
cp ~/LinuxFundamentals2015/Week1/hostname.txt /cs/work/home/jxhou/;

ssh ukko050.hpc.cs.helsinki.fi cat hostname.txt;
