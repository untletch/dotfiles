import json
from random import shuffle


class Bible:
    def shuffle_list(self):
        with open("bible.json") as f:
            self.bible_list = json.load(f)
        self.rand_index = list(range(0, 235))
        shuffle(self.rand_index)

    def display(self):
        ind = self.rand_index[0]
        print("\x1b[6;30;42m" + self.bible_list[ind][1] + "\x1b[0m")
        print("\x1b[6;30;43m" + self.bible_list[ind][2] + "\x1b[0m")


bible = Bible()
bible.display()
