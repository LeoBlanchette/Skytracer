#
#   Sends a command to the camera controller process to take a picture.
#   Connects REQ socket to tcp://localhost:5555
#

import zmq

context = zmq.Context()

#  Socket to talk to server
socket = context.socket(zmq.REQ)
socket.connect("tcp://localhost:5555")

socket.send(b"CaptureImage")

#  Get the reply.
message = socket.recv()


