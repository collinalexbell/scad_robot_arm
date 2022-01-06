from direct.showbase.ShowBase import ShowBase
import time

from math import pi, sin, cos
from direct.showbase.ShowBase import ShowBase
from direct.task import Task
from direct.actor.Actor import Actor


class MyApp(ShowBase):


    def __init__(self):

        ShowBase.__init__(self)


        # Load the environment model.

        self.scene = self.loader.loadModel("models/environment")
        self.robot = self.loader.loadModel("./onix_bot.stl")

        # Reparent the model to render.

        self.robot.reparentTo(self.scene)
        self.scene.reparentTo(self.render)

        # Apply scale and position transforms on the model.

        self.robot.setScale(0.25, 0.25, 0.25)
        self.robot.setPos(0,0,30)
        self.scene.setScale(0.25, 0.25, 0.25)

        # Add the spinCameraTask procedure to the task manager.
        self.taskMgr.add(self.spinCameraTask, "SpinCameraTask")
        self.taskMgr.add(self.moveRobotTask, "MoveSameTask")

        # Load and transform the panda actor.
        self.pandaActor = Actor("models/panda-model",
                                {"walk": "models/panda-walk4"})
        self.pandaActor.setScale(0.005, 0.005, 0.005)
        self.pandaActor.reparentTo(self.render)
        # Loop its animation.
        self.pandaActor.loop("walk")

    # Define a procedure to move the camera.
    def spinCameraTask(self, task):
        angleDegrees = task.time * 6.0
        angleRadians = angleDegrees * (pi / 180.0)
        self.camera.setPos(20 * sin(angleRadians), -20 * cos(angleRadians), 3)
        self.camera.setHpr(angleDegrees, 0, 0)
        return Task.cont

    def moveRobotTask(self, task):
        x = task.time * 6.0
        self.robot.setPos(x,0,0)
        return Task.cont


app = MyApp()

app.run()
