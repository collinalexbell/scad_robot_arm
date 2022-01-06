from direct.showbase.ShowBase import ShowBase
import time



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

        self.scene.setScale(0.25, 0.25, 0.25)


app = MyApp()

app.run()
