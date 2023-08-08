import itertools
import subprocess


JUST_VERSIONS = [
    '1.14.0',
    '1.13.0',
    '1.12.0',
]
RUNNERS = [
    'alpine:3.18',
    'alpine:3.17',
    'alpine:3.16',
    'debian:trixie-slim',
    'debian:bookworm-slim',
    'debian:bullseye-slim',
    'debian:buster-slim',
    'docker:dind',
    'docker:dind-rootless',
    'docker:git',
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
