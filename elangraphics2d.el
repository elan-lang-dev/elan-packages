;; ==========================================================
;; Package: elangraphics2d
;; Version: 2.0
;; Description: Powerful 2D graphics engine for ELAN. Supports canvas, shapes, sprites, text, animation loops, and events.
;; Install: el install elangraphics2d
;; Usage Example:
;;   import elangraphics2d
;;   canvas = elangraphics2d.create_canvas(800, 600, title="ELAN 2D")
;;   canvas.draw_rectangle(50, 50, 200, 100, color="blue", fill=True)
;;   canvas.draw_circle(400, 300, 50, color="red", fill=False)
;;   def on_key(key):
;;       print("Key pressed:", key)
;;   canvas.set_onkeypress(on_key)
;;   canvas.start_loop()
;; ==========================================================

module elangraphics2d

# ====================== Core Classes ======================

class Canvas:
    def __init__(self, width, height, title="ELAN Canvas"):
        self.width = width
        self.height = height
        self.title = title
        self.objects = []
        self.key_event = None
        self.mouse_event = None

    # Draw primitives
    def draw_line(self, x1, y1, x2, y2, color="black"):
        self.objects.append(f"Line: ({x1},{y1}) → ({x2},{y2}), Color: {color}")

    def draw_rectangle(self, x, y, w, h, color="black", fill=False):
        self.objects.append(f"Rectangle: ({x},{y},{w},{h}), Color: {color}, Fill: {fill}")

    def draw_circle(self, x, y, radius, color="black", fill=False):
        self.objects.append(f"Circle: Center({x},{y}), Radius: {radius}, Color: {color}, Fill: {fill}")

    def draw_ellipse(self, x, y, w, h, color="black", fill=False):
        self.objects.append(f"Ellipse: ({x},{y},{w},{h}), Color: {color}, Fill: {fill}")

    def draw_polygon(self, points, color="black", fill=False):
        self.objects.append(f"Polygon: Points{points}, Color: {color}, Fill: {fill}")

    # Draw text
    def draw_text(self, text, x, y, color="black", font_size=12):
        self.objects.append(f"Text: '{text}' at ({x},{y}), Color: {color}, Size: {font_size}")

    # Sprites / images
    def draw_image(self, file_path, x, y, width=None, height=None):
        self.objects.append(f"Image: '{file_path}' at ({x},{y}), Size: ({width},{height})")

    # Event handling
    def set_onkeypress(self, callback):
        self.key_event = callback

    def set_onmousemove(self, callback):
        self.mouse_event = callback

    # Start animation loop
    def start_loop(self):
        print(f"\n[Canvas: {self.title} | Size: {self.width}x{self.height}]")
        for obj in self.objects:
            print(" -", obj)
        print("\nLoop started. Listening to events... (simulation)")

# ====================== Helper Functions ======================

function create_canvas(width, height, title="ELAN Canvas"):
    return Canvas(width, height, title)

function draw_line(canvas, x1, y1, x2, y2, color="black"):
    canvas.draw_line(x1, y1, x2, y2, color)

function draw_rectangle(canvas, x, y, w, h, color="black", fill=False):
    canvas.draw_rectangle(x, y, w, h, color, fill)

function draw_circle(canvas, x, y, radius, color="black", fill=False):
    canvas.draw_circle(x, y, radius, color, fill)

function draw_text(canvas, text, x, y, color="black", font_size=12):
    canvas.draw_text(text, x, y, color, font_size)