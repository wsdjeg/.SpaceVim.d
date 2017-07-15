#!/usr/bin/python 
# -*- coding: UTF-8 -*- 
import gi 

gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class CellRendererComboWindow(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="CellRendererCombo Example")
        self.set_default_size(200, 200)

        # 数据源
        list_store = Gtk.ListStore(str)
        list_store.append(["PHP"])
        list_store.append(["Python"])
        list_store.append(["Swift"])
        list_store.append(["Shell"])

        self.list_store_default = Gtk.ListStore(str, str)
        self.list_store_default.append(["最好的语言", "PHP"])
        self.list_store_default.append(["时间不多了", "Python"])
        self.list_store_default.append(["全美推广", "Swift"])

        tree_view = Gtk.TreeView(model=self.list_store_default)

        renderer_text = Gtk.CellRendererText()
        column_text = Gtk.TreeViewColumn("编程留言", renderer_text, text=0)
        tree_view.append_column(column_text)

        renderer_combo = Gtk.CellRendererCombo()
        renderer_combo.set_property("editable", True)
        renderer_combo.set_property("model", list_store)
        renderer_combo.set_property("text-column", 0)
        renderer_combo.set_property("has-entry", False)
        renderer_combo.connect("edited", self.on_combo_changed)

        column_combo = Gtk.TreeViewColumn("Combo", renderer_combo, text=1)
        tree_view.append_column(column_combo)

        self.add(tree_view)

    def on_combo_changed(self, widget, path, text):
        self.list_store_default[path][1] = text



win = CellRendererComboWindow()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()
