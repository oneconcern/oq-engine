import atexit
import signal
import sys

from django.core.management.commands.runserver import BaseRunserverCommand
from openquake.server import sub_job_manager


class Command(BaseRunserverCommand):
    def __init__(self, *args, **kwargs):
        print("Custom runserver")
        atexit.register(self._exit)
        signal.signal(signal.SIGINT, self._handle_SIGINT)
        sub_job_manager.start_sub_job_manager()
        super(Command, self).__init__(*args, **kwargs)

    def _exit(self):
        sub_job_manager.stop_sub_job_manager()

    def _handle_SIGINT(self, signal, frame):
        self._exit()
        sys.exit(0)
