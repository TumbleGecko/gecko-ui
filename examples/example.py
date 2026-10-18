#!/usr/bin/env python3
"""Open the example window with the shared parts"""

import sys
from pathlib import Path

from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

ROOT = Path(__file__).resolve().parent.parent


def main():
	application = QGuiApplication(sys.argv)
	interface = QQmlApplicationEngine()
	interface.addImportPath(str(ROOT / "qml"))
	interface.load(QUrl.fromLocalFile(str(ROOT / "examples" / "Example.qml")))
	if not interface.rootObjects():
		return 1
	return application.exec()


if __name__ == "__main__":
	sys.exit(main())
