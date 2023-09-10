#
#   Captures a camera image upon notification.
#   Binds REP socket to tcp://*:5555
#
from datetime import datetime 
import time
import zmq

context = zmq.Context()
socket = context.socket(zmq.REP)
socket.bind("tcp://*:5555")

while True:
    #  Wait for next request from client
    message = socket.recv()
    if message == b"CaptureImage":
        now = datetime.now()
        current_time = now.strftime("%H:%M:%S")
        print("Capturing image: %s" % current_time)

        #  Send reply back to client
        socket.send(b"CapturedTheImage")

#  Do some 'work'
    time.sleep(1)

