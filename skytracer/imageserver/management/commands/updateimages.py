from django.core.management.base import BaseCommand, CommandError

#https://docs.djangoproject.com/en/4.2/howto/custom-management-commands/

class Command(BaseCommand):
    help = "Closes the specified poll for voting"

    def add_arguments(self, parser):
        parser.add_argument("--path", nargs="?", type=str)

    def handle(self, *args, **options):
        
        path = options["path"]
        if path is None:
            self.stdout.write("Please include a path to the skytracer images.")
            return

        

        self.stdout.write("Processing images at: %s\n"%(path), ending="")

