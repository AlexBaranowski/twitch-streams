#!/usr/bin/env python3

import requests
import json
import argparse


def check_vagrant_box(vagrant_box, providers):
    api_url = 'https://app.vagrantup.com/api/v1/box/{}'.format(vagrant_box)
    print("checking {} with providers {}".format(vagrant_box, providers))
    r = requests.get(api_url)
    assert r.status_code == 200
    vagrantup_dict = json.loads(r.text)
    current_providers = vagrantup_dict['current_version']['providers']
    # 'ok' because there might be more
    expected_ok_providers_num = len(providers)
    found_providers = 0
    for p in current_providers:
        if p['name'] in providers:
            found_providers += 1
            print("Found provider {} for box {}".format(p['name'],
                                                        vagrant_box))
    return expected_ok_providers_num == found_providers


def main():
    parser = argparse.ArgumentParser(description="Give me fuel")
    parser.add_argument('-p', '--provider', help='Vagrant provider that is\
                        required', required=True, action='append')
    parser.add_argument('vagrant_boxes', help="Vagrant box/es to check",
                        nargs='+')
    args = parser.parse_args()
    print(args)
    fail_flag = False
    failed_boxes = []
    for box in args.vagrant_boxes:
        rv = check_vagrant_box(box, args.provider)
        if not rv:
            fail_flag = True
            failed_boxes.append(box)

    if fail_flag:
        print("There is problem with following boxes")
        print(' '.join(failed_boxes))
        exit(1)

    print("All providers for given boxes were found!")

if __name__ == '__main__':
    main()
