from direct.showbase.ShowBase import ShowBase
import time

from math import pi, sin, cos
from direct.showbase.ShowBase import ShowBase
from direct.task import Task
from direct.actor.Actor import Actor

class Car_Base():
    def __init__(self):
        self.x = 0
        self.y = 0
        self.zuz = 0
        self.models = []
    def add_model(self, model):
       self.models.append(model)

    def forward(self, units_forward):
        self.x = self.x + units_forward
        self.models[0].setPos(self.x, self.y, self.zuz)

class MyApp(ShowBase):


    def __init__(self):

        ShowBase.__init__(self)


        # Load the environment model.

        self.last_tick = 0
        self.car_base = Car_Base()
        self.scene = self.loader.loadModel("models/environment")
        self.robot = self.loader.loadModel("./onix_bot.stl")
        self.car_base.add_model(self.robot)


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
        forward = (task.time - self.last_tick)*4
        self.car_base.forward(forward)
        self.last_tick = task.time
        return Task.cont

app = MyApp()

app.run()
