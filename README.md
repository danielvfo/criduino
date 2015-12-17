# criduino
Ruby on Rails app featuring socket communication to send commands to Arduino devices.
Initially this work was created as the following abstract:

This work presents an Arduino based device that allows users to remotely
water their domestic plants. The device is basically composed of an Arduino
Uno as well as an Arduino Ethernet Shield connected to a water valve
that controls if the water will pass or not depending on the user’s desire. Besides
this, the system is also composed of a web interface that controls the device
via internet. In other words, this work describes the construction and the functioning
of a domestic irrigation system that allows the users to travel, work or
hang out without worrying about their domestic plants hydration.

Abstract written by: {danielf, gabriellovetro, thales}@alunos.utfpr.edu.br

This repository stores the web app that is supposed to control remote devices.

Featuring gems:
gem 'bootstrap-material-design'
gem 'devise'

Featuring in-app algorithms:
/app/models/device.rb -> mac address validation
/app/controllers/devices_controller.rb -> "turn_on" and "turn_off" methods used to send and receive commands from the client (still needs improvements)

This repository also provides a file called "Client_to_test_the_server.rb" that can be used locally to test the client-server communication.
It's important to note that the mac address of the device that you're willing to test has to match with the mac address hard-coded in this file.



