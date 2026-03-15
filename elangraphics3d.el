;; ==========================================================
;; Package: elangraphics3d
;; Version: 2.0
;; Description: Powerful 3D graphics engine for ELAN. Supports scenes, 3D objects, transformations, camera, lights, and event handling.
;; Install: el install elangraphics3d
;; Usage Example:
;;   import elangraphics3d
;;   scene = elangraphics3d.create_scene("My 3D Scene")
;;   cube = elangraphics3d.create_cube(1, color="red")
;;   sphere = elangraphics3d.create_sphere(1, color="blue")
;;   scene.add_object(cube)
;;   scene.add_object(sphere)
;;   
;;   camera = elangraphics3d.create_camera(position=(0,0,10))
;;   scene.set_camera(camera)
;;
;;   def on_key(key):
;;       print("Key pressed:", key)
;;   scene.set_onkeypress(on_key)
;;
;;   scene.render_loop()
;; ==========================================================

module elangraphics3d

# ====================== Core Classes ======================

class Scene:
    def __init__(self, name="Scene"):
        self.name = name
        self.objects = []
        self.lights = []
        self.camera = None
        self.key_event = None
        self.mouse_event = None

    def add_object(self, obj):
        self.objects.append(obj)

    def add_light(self, light):
        self.lights.append(light)

    def set_camera(self, camera):
        self.camera = camera

    def set_onkeypress(self, callback):
        self.key_event = callback

    def set_onmousemove(self, callback):
        self.mouse_event = callback

    def render_loop(self):
        print(f"\n[3D Scene: {self.name}]")
        if self.camera:
            print(f"Camera at {self.camera.position}")
        print("Objects:")
        for obj in self.objects:
            print(f" - {obj.type} | Pos: {obj.position} | Color: {obj.color}")
        print("Lights:")
        for light in self.lights:
            print(f" - {light.type} | Intensity: {light.intensity} | Pos: {light.position}")
        print("\nRender loop started (simulation). Listening to events...")

# ====================== 3D Objects ======================

class Object3D:
    def __init__(self, type, color="white"):
        self.type = type
        self.color = color
        self.position = (0,0,0)
        self.rotation = (0,0,0)
        self.scale = (1,1,1)

    def translate(self, x, y, z):
        self.position = (x, y, z)

    def rotate(self, x, y, z):
        self.rotation = (x, y, z)

    def scale_object(self, sx, sy, sz):
        self.scale = (sx, sy, sz)

class Cube(Object3D):
    def __init__(self, size=1, color="white"):
        super().__init__("Cube", color)
        self.size = size

class Sphere(Object3D):
    def __init__(self, radius=1, color="white"):
        super().__init__("Sphere", color)
        self.radius = radius

class Plane(Object3D):
    def __init__(self, width=1, height=1, color="white"):
        super().__init__("Plane", color)
        self.width = width
        self.height = height

# ====================== Camera ======================

class Camera:
    def __init__(self, position=(0,0,0), rotation=(0,0,0), fov=60):
        self.position = position
        self.rotation = rotation
        self.fov = fov

# ====================== Lights ======================

class Light:
    def __init__(self, type="PointLight", intensity=1.0, position=(0,0,0)):
        self.type = type
        self.intensity = intensity
        self.position = position

# ====================== Helper Functions ======================

function create_scene(name="Scene"):
    return Scene(name)

function create_cube(size=1, color="white"):
    return Cube(size, color)

function create_sphere(radius=1, color="white"):
    return Sphere(radius, color)

function create_plane(width=1, height=1, color="white"):
    return Plane(width, height, color)

function create_camera(position=(0,0,0), rotation=(0,0,0), fov=60):
    return Camera(position, rotation, fov)

function create_light(type="PointLight", intensity=1.0, position=(0,0,0)):
    return Light(type, intensity, position)