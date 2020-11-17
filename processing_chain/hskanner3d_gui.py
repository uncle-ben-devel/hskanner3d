#!/usr/bin/env python
from tkinter import *
from hskanner3d_script import *



class main_window:
    def __init__(self, parent):
        super(main_window, self).__init__(parent)
        self.label = Label(self, text="HSkanner3D Control Panel")
        self.label.pack(padx=20, pady=20)

def main():
    hs = hska3d()
    window_root = Tk()
    window_root = main_window(window_root)
    btn_start  = Button(window_root, text = 'Click me !', bd = '5')
    btn_start.pack(side = 'top')
    window_root.mainloop()

if __name__ == "__main__":
    main()

    


