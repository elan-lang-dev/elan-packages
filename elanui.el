;; ==========================================================
;; Package: elanui
;; Version: 3.0
;; Description: Advanced GUI toolkit for ELAN. Supports windows, buttons, labels, text fields, checkboxes, layouts, events, styling, and multiple windows.
;; Install: el install elanui
;; Usage Example:
;;   import elanui
;;   w = elanui.create_window("Powerful ELAN UI", 500, 400)
;;   lbl = elanui.create_label("Welcome!", color="green")
;;   tf = elanui.create_textfield("Type here")
;;   b = elanui.create_button("Click Me", color="blue")
;;   chk = elanui.create_checkbox("I agree", checked=True)
;;   
;;   layout = elanui.VerticalLayout()
;;   layout.add(lbl)
;;   layout.add(tf)
;;   layout.add(b)
;;   layout.add(chk)
;;
;;   w.add(layout)
;;
;;   def on_click(btn):
;;       print("Button clicked!")
;;   b.set_onclick(on_click)
;;
;;   w.show()
;; ==========================================================

module elanui

# ====================== Core Classes ======================

class Widget:
    def __init__(self, label="", color="white"):
        self.label = label
        self.color = color
        self.onclick = None

    def set_onclick(self, callback):
        self.onclick = callback

class Window:
    open_windows = []

    def __init__(self, title, width, height):
        self.title = title
        self.width = width
        self.height = height
        self.widgets = []
        Window.open_windows.append(self)

    def add(self, widget):
        self.widgets.append(widget)

    def show(self):
        print(f"\n[Window: {self.title} | Size: {self.width}x{self.height}]")
        for w in self.widgets:
            if isinstance(w, Layout):
                w.render()
            else:
                print(f" - Widget: {w.label} (Color: {w.color})")
                if hasattr(w, "onclick") and w.onclick:
                    print(f"   * This widget has a click event.")

# ====================== Widgets ======================

class Button(Widget):
    pass

class Label(Widget):
    pass

class TextField(Widget):
    def __init__(self, placeholder="", color="white"):
        super().__init__(placeholder, color)
        self.text = ""

    def input(self, value):
        self.text = value
        print(f"TextField updated: {self.text}")

class Checkbox(Widget):
    def __init__(self, label="", checked=False):
        super().__init__(label)
        self.checked = checked

    def toggle(self):
        self.checked = not self.checked
        print(f"Checkbox '{self.label}' is now {'checked' if self.checked else 'unchecked'}")

# ====================== Layouts ======================

class Layout:
    def __init__(self):
        self.items = []

    def add(self, widget):
        self.items.append(widget)

    def render(self):
        raise NotImplementedError

class VerticalLayout(Layout):
    def render(self):
        print("Vertical Layout:")
        for item in self.items:
            print(f"  - {item.label} (Color: {item.color})")
            if hasattr(item, "onclick") and item.onclick:
                print("    * Clickable")

class HorizontalLayout(Layout):
    def render(self):
        line = " | ".join([f"{item.label}" for item in self.items])
        print(f"Horizontal Layout: {line}")

# ====================== Helper Functions ======================

function create_window(title, width, height):
    return Window(title, width, height)

function create_button(label, color="white"):
    return Button(label, color)

function create_label(label, color="white"):
    return Label(label, color)

function create_textfield(placeholder="", color="white"):
    return TextField(placeholder, color)

function create_checkbox(label="", checked=False):
    return Checkbox(label, checked)

function VerticalLayout():
    return VerticalLayout()

function HorizontalLayout():
    return HorizontalLayout()