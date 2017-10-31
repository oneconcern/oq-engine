import threading
import time

# probably locking around would be a good idea
_submitted_jobs = []
_submitted_job_manager = None
_submitted_job_manager_st = True


def start_sub_job_manager():
    global _submitted_job_manager
    global _submitted_job_manager_st

    _submitted_job_manager_st = True
    if _submitted_job_manager is None:
        _submitted_job_manager = threading.Thread(
            target=sub_job_manager)
        _submitted_job_manager.start()


def stop_sub_job_manager():
    global _submitted_job_manager
    global _submitted_job_manager_st

    _submitted_job_manager_st = False
    _submitted_job_manager.join()


def sub_job_manager():
    global _submitted_jobs
    global _submitted_job_manager

    while _submitted_job_manager_st is True:
        for i, sub in enumerate(_submitted_jobs):
            if sub.poll() is not None:
                # here return value
                del _submitted_jobs[i]
        time.sleep(0.25)


def sub_job_append(popen):
    _submitted_jobs.append(popen)
