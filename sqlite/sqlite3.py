import hashlib
import os
import pathlib
from datetime import datetime

import requests
from bs4 import BeautifulSoup

CONNECT_TIMEOUT, READ_TIMEOUT = 1, 10


def scrape_downloads_page():
    url = "https://www.sqlite.org/download.html"
    resp = requests.get(url, timeout=(CONNECT_TIMEOUT, READ_TIMEOUT))
    if resp.status_code != 200:
        raise Exception(f"error: response status code: {resp.status_code}")
    soup = BeautifulSoup(resp.content, "html.parser")
    filename_tag = soup.find(id="a5")
    filename = soup.find(id="a5").text.strip()
    file_hash = filename_tag.parent.parent.find("small").text.split()[1].strip(")")
    return file_hash, filename


def download_sqlite_binary():
    _, filename = scrape_downloads_page()
    filepath = os.path.join(pathlib.Path.home(), "Downloads", filename)
    url = f"https://www.sqlite.org/{datetime.now().year}/{filename}"
    resp = requests.get(url, timeout=(CONNECT_TIMEOUT, READ_TIMEOUT))
    if resp.status_code != 200:
        raise Exception(f"error: response status code: {resp.status_code}")
    with open(filepath, "wb") as f:
        for chunk in resp.iter_content(chunk_size=4 * 1024):
            f.write(chunk)
    return filepath


def compare_hash():
    BLOCK_SIZE = 4 * 1024
    saved_filename = download_sqlite_binary()
    expected, _ = scrape_downloads_page()

    file_hash = hashlib.sha3_256()
    with open(saved_filename, "rb") as f:
        fb = f.read(BLOCK_SIZE)
        while len(fb) > 0:
            file_hash.update(fb)
            fb = f.read(BLOCK_SIZE)

    digest = file_hash.hexdigest()
    assert expected == digest, f"expected {expected} got {digest}"


if __name__ == "__main__":
    download_sqlite_binary()
    compare_hash()
