import { Fragment, useState } from 'react'
import { Listbox, Transition } from '@headlessui/react'
import { CheckIcon, ChevronUpDownIcon } from '@heroicons/react/20/solid'
import React, { Component } from "react";
import axios from "axios";

const filters = [
  { name: 'Category' },
  { name: 'User' },
  { name: 'City' },
  { name: 'Keyword' },
]

const URL = "https://jsonplaceholder.typicode.com/users";

function Media() {
    const [selected, setSelected] = useState(filters[0]);
    const [media, setMedia] = useState([]);
    const fetchDatas = async () => {
        try {
          const response = await axios.get(URL);
            console.log(response.data);
            setMedia(response.data);
            //return response.data
        } catch (error) {
            console.log(error.response);
            return error;
        }
    
    }
    //setMedia(fetchDatas());
    
    return (
        <div className="Media_List pt-8 md:px-10 bg-gray-100 pb-8">
            <h1 className="font-bold text-8xl grid place-items-center">Media</h1>
            <div className="filter_menu flex items-center justify-around flex-row bg-red-500 gap-5">
                <h1 className="text-center font-bold text-bold text-4xl">Filter By</h1>
                <div className="w-60">
                    <Listbox value={selected} onChange={setSelected}>
                        <div className="relative mt-1">
                        <Listbox.Button className="relative w-full cursor-default rounded-lg bg-white py-2 pl-3 pr-10 text-left shadow-md focus:outline-none focus-visible:border-indigo-500 focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-opacity-75 focus-visible:ring-offset-2 focus-visible:ring-offset-orange-300 sm:text-sm">
                            <span className="block truncate">{selected.name}</span>
                            <span className="pointer-events-none absolute inset-y-0 right-0 flex items-center pr-2">
                            <ChevronUpDownIcon
                                className="h-5 w-5 text-gray-400"
                                aria-hidden="true"
                            />
                            </span>
                        </Listbox.Button>
                        <Transition
                            as={Fragment}
                            leave="transition ease-in duration-100"
                            leaveFrom="opacity-100"
                            leaveTo="opacity-0"
                        >
                            <Listbox.Options className="absolute mt-1 max-h-60 w-full overflow-auto rounded-md bg-white py-1 text-base shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none sm:text-sm">
                            {filters.map((person, personIdx) => (
                                <Listbox.Option
                                key={personIdx}
                                className={({ active }) =>
                                    `relative cursor-default select-none py-2 pl-10 pr-4 ${
                                    active ? 'bg-amber-100 text-amber-900' : 'text-gray-900'
                                    }`
                                }
                                value={person}
                                >
                                {({ selected }) => (
                                    <>
                                    <span
                                        className={`block truncate ${
                                        selected ? 'font-medium' : 'font-normal'
                                        }`}
                                    >
                                        {person.name}
                                    </span>
                                    {selected ? (
                                        <span className="absolute inset-y-0 left-0 flex items-center pl-3 text-amber-600">
                                        <CheckIcon className="h-5 w-5" aria-hidden="true" />
                                        </span>
                                    ) : null}
                                    </>
                                )}
                                </Listbox.Option>
                            ))}
                            </Listbox.Options>
                        </Transition>
                        </div>
                    </Listbox>
                </div>
            </div>   
            <div className="mt-5 grid grid-cols-3  gap-5 content-center">
                <div className="flex flex-col bg-white px-8 py-6 max-w-sm rounded-xl shadow-lg mt-5">
                    <div className="flex justify-center items-center">
                        <a className="px-2 py-1 bg-gray-600 text-sm text-green-100 rounded" href="#">Catégory</a>
                    </div>
                    <div class="mt-4">
                        <a className="text-lg text-gray-700 font-medium text-center" href="#">Title</a>
                    </div>
                    <div className="flex justify-between gap-5 items-center mt-4">
                        <div className="flex items-center">
                            <a className="text-gray-700 text-sm mx-3 font-bold" href="#">Author</a>
                        </div>
                        <span className="font-light text-sm text-gray-600">City</span>
                        <span className="font-light text-sm text-gray-600">Owner</span>
                    </div>
                </div>
            </div>         
        </div>
    );
  }

export default Media;
