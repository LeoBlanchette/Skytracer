#
#   Captures a camera image upon notification.
#   Binds REP socket to tcp://*:5555
#

import os
from pathlib import Path
from datetime import datetime 
import time
import zmq
import cv2

# Main vars
home = Path.home()
imagedir = os.path.join(home, "Images")

# ZMQ Setup

context = zmq.Context()
socket = context.socket(zmq.REP)
socket.bind("tcp://*:5555")

# CV2 Setup

cap = cv2.VideoCapture(2)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1920)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 1080)

if not os.path.exists(imagedir):
    os.mkdir(imagedir)

# Generates the filename string pertaining to time.


def get_current_time_string():
    d = datetime.now()
    year = d.year
    month = d.month
    day = d.day
    hour = d.hour
    minute = d.minute
    timestring = "%i_%i_%i_%i_%i" % (year, month, day, hour, minute)
    return timestring


while True:
    # Read from camera...
    ret, frame = cap.read()
    
    #uncomment for local testing
    #cv2.imshow('frame', frame)
   
    if cv2.waitKey(1) == ord('q'):
        break

    try:

        message = socket.recv(flags=zmq.NOBLOCK)
        
        if message == b"CaptureImage":

            cv2.imwrite(os.path.join(imagedir, get_current_time_string()+".jpg"), frame)

            # Send reply to client
            socket.send(b"Captured")
    except zmq.Again as e:
        continue


cap.release()
cv2.destroyAllWindows()


