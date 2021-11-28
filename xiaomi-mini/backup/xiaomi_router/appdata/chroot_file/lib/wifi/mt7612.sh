#!/bin/sh
append DRIVERS "mt7612"

. /lib/wifi/ralink_common.sh

prepare_mt7612() {
	prepare_ralink_wifi mt7612
}

scan_mt7612() {
	scan_ralink_wifi mt7612 mt76x2e
}

disable_mt7612() {
	disable_ralink_wifi mt7612
}

enable_mt7612() {
	enable_ralink_wifi mt7612 mt76x2e
}

detect_mt7612() {
	detect_ralink_wifi mt7612 mt76x2e
}


