#! /usr/bin/env python

import mvc
import cv2
import numpy as np


class CameraProcessor(mvc.InputProcessor):

    def __init__(self, camera_index=0):
        self.capture = cv2.VideoCapture(camera_index)
        super(CameraProcessor, self).__init__()

    def _convert_to_siganl(self, *args, **kargs):
        ret, frame = self.capture.read()

    def on_stop(self):
        self.capture.release()

