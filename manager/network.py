import requests
import json
import argparse


parser = argparse.ArgumentParser()
parser.add_argument('--ip', help='IP address')
parser.add_argument('--port', help='Port number')
args = parser.parse_args()
ip = args.ip
port = args.port
url = f'http://{ip}:{port}/manager'

def net_UploadGameMess(gamename,download_url):
    params = {
        'Action' : 'Update',
        'name' : gamename,
        'download_url' : download_url
    }
    return requests.post(url,json=params).json()

