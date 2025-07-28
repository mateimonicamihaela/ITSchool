#!/usr/bin/env python3

import hashlib

def hash_string_sha256(text):
    return hashlib.sha256(text.encode()).hexdigest()

def hash_file_sha256(filepath):
    try:
        with open(filepath, "rb") as f:
            return hashlib.sha256(f.read()).hexdigest()
    except FileNotFoundError:
        return None

