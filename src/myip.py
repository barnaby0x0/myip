#!/usr/bin/env python3

import requests

def get_public_ip():
    try:
        # Send a GET request to ifconfig.me to get the public IP
        response = requests.get('https://ifconfig.me')
        
        # Raise an exception if the request was not successful
        response.raise_for_status()
        
        # Return the response text, which contains the IP address
        return response.text.strip()
    except requests.RequestException as e:
        print(f"Error retrieving IP: {e}")
        return None

def main ():
    ip_address = get_public_ip()
    if ip_address:
        print(f"{ip_address}", end="")

if __name__ == "__main__":
    main()
