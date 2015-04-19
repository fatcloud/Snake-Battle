#! /usr/bin/env python

import mvc
import cv2
import numpy as np

class CamWatcher(mvc.Controller):

    def __init__(self, **kargs):
        self.capture = cv2.VideoCapture(0)
        super(self.__class__, self).__init__(**kargs)
        

    def _convert_to_siganl(self, *args, **kargs):
        ret, frame = self.capture.read()
        

    def on_stop(self):
        self.capture.release()

