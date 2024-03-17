import itertools
import subprocess


JUST_VERSIONS = [
    '1.25.2',
    # '1.25.0',
    # '1.24.0',
    # '1.14.0',
    # '1.13.0',
    # '1.12.0',
]
RUNNERS = [
    'alpine:3.19.1',
    'alpine:3.18.6',
    'alpine:3.17.7',
    'alpine:3.16.9',
    'debian:trixie-slim', # 13
    'debian:bookworm-slim',# 12
    'debian:bullseye-slim', # 11
    'debian:buster-slim', # 10
    'docker:25.0.4-dind',
    'docker:25.0.4-dind-rootless',
    'docker:25.0.4-git',
    'docker:24.0.6-dind',
    'docker:24.0.6-dind-rootless',
    'docker:24.0.6-git',
]


def run(
    *,
    __TAG_PREFIX: str,
    _RUNNER: str,
    _JUST_VERSION: str,
    recipe: str,
):
    command = f'just {__TAG_PREFIX=} {_RUNNER=} {_JUST_VERSION=} {recipe}'
    subprocess.run(command, shell=True, check=True)


RECIPE = 'build_and_push'
variants = itertools.product(JUST_VERSIONS[::-1], RUNNERS[::-1])
for _JUST_VERSION, _RUNNER in variants:
    run(
        __TAG_PREFIX=_RUNNER.replace(':', '-') + '-',
        _RUNNER=_RUNNER,
        _JUST_VERSION=_JUST_VERSION,
        recipe=RECIPE,
    )
    if _RUNNER == RUNNERS[0]:
        run(
            __TAG_PREFIX='',
            _RUNNER=_RUNNER,
            _JUST_VERSION=_JUST_VERSION,
            recipe=RECIPE,
        )
        if _JUST_VERSION == JUST_VERSIONS[0]:
            run(
                __TAG_PREFIX='',
                _RUNNER=_RUNNER,
                _JUST_VERSION=_JUST_VERSION,
                recipe=RECIPE + '_latest',
            )
