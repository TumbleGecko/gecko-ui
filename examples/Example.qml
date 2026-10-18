// A small window that shows each shared part
import QtQuick
import QtQuick.Controls.Basic
import GeckoUi

ApplicationWindow {
	width: 640
	height: 400
	visible: true
	title: "gecko-ui example"
	color: Theme.ground

	Column {
		anchors.centerIn: parent
		spacing: 20

		Text {
			text: "gecko-ui"
			color: Theme.textStrong
			font.pixelSize: Theme.headingSize
		}

		GeckoButton {
			primary: true
			text: "Ask for the password"
			onClicked: password.open()
		}

		GeckoButton {
			danger: true
			text: "Remove"
		}

		Toggle {}
	}

	PasswordDialog {
		id: password
		appName: "The example"
		reason: "This only shows the dialog."
		actionText: "Close"
		checkPassword: entered => true
	}
}
